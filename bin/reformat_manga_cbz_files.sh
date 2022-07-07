#!/usr/bin/env bash


for f in *.cbz; do
	echo "Processing file $f"

	[ -d "${f}.folder" ] || unzip "$f" -d "${f}.folder"

	cd "${f}.folder"

	for chf in ./*; do
		echo "Processing $chf"

		substring=$(echo "$chf" | cut -d'.' -f 4)
		chapter_num=$(echo "$substring" | cut -d' ' -f 1)
		padded_chapter_num=$(printf %03d $chapter_num)

		cd "$chf"

		for pgf in ./*; do
			temp="ch${padded_chapter_num}p$pgf"
			newname=$(echo "$temp" | sed "s/\.\///")

			echo "Renaming $pgf to $newname"
			mv "$pgf" ../"$newname"
		done

		cd ../
		rm -rf "$chf"
	done

	cd ../

	[ -d "${f}.folder" ] && rm "$f"

	zip -r "$f" "${f}.folder"
done
