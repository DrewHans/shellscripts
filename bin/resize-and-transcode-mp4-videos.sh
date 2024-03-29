#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}


function process_video_file {
	video_codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$1")

	video_height=$(ffprobe -v error -show_entries stream=height -of default=noprint_wrappers=1 "$1")
	video_height=${video_height#*=}

	echo $1
	echo $video_codec
	echo $video_height

	if [ $video_height -le "720" ] && [ $video_codec = "hevc" ]; then
		# video height is less than or equal to 720p and codec is already hevc
		echo "Nothing to do here; skipping $1"

	elif [ $video_height -le "720" ] && [ $video_codec = "h264" ]; then
		# video height is good, but codec is not => HEVC transcode (no resize)

		ffmpeg \
		-hwaccel cuda \
		-hwaccel_output_format cuda \
		-i "$1" \
		-map 0 \
		-c:a copy \
		-c:s copy \
		-c:v hevc_nvenc \
		"${1%.mp4} (${video_height}p) [HEVC].mp4"

	elif [ $video_height -gt "720" ]; then
		# video height is not good => resize & HEVC transcode

		ffmpeg \
		-hwaccel cuda \
		-hwaccel_output_format cuda \
		-i "$1" \
		-map 0 \
		-c:a copy \
		-c:s copy \
		-vf "scale_npp=-2:720" \
		-c:v hevc_nvenc \
		"${1%.mp4} (720p) [HEVC].mp4"

	else
		echo "We encountered something unexpected."
	fi

	echo ""
}


# safety checks
check_dependency "ffmpeg"
check_dependency "ffprobe"

if [ $# -eq 0 ]
then
	for f in *.mp4; do
		process_video_file "$f"
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	for f in $1/*.mp4; do
		process_video_file "$f"
	done
fi

if [ $# -eq 1 ] && [ -f "$1" ]
then
	process_video_file "$1"
fi

# ffmpeg options explained:
# -hwaccel cuda => enable cuda hardware acceleration
# -hwaccel_output_format cuda => avoid raw data copy between GPU memory & system memory
# -i "$1" => the input file
# -map 0 => select all streams from the input file
# -c:a copy => copy all audio streams without transcoding
# -c:s copy => copy all subtitles without changing them
# -vf "scale_npp=-2:720" => resize height to 720p but keep aspect ratio and make width divisible by two
# -c:v hevc_nvenc => transcode video to hevc codec using hevc_nvenc

echo "$0 finished"
