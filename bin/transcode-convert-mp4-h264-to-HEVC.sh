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

	if [ $video_codec = "h264" ]; then
		ffmpeg \
		-hwaccel cuda \
		-hwaccel_output_format cuda \
		-i "$1" \
		-c:v hevc_nvenc \
			-preset medium \
		-c:a aac \
			-strict experimental \
			-b:a 128k \
		"${1%.mp4} [HEVC].mp4"

		# note, use h264_nvenc encoder for testing since it's faster
	else
		echo "Skipping $1 because video codec is $video_codec"
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

echo "$0 finished"
