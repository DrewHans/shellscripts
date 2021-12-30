#!/usr/bin/env python


import os, subprocess


print("Starting.")

for root, dirs, files in os.walk(".", topdown=False):
    i = 1
    for dname in dirs:
        print(f"zipping {dname} ({i} of {len(dirs)})")
        bash_command = f'zip -r ./"{dname}.cbz" ./"{dname}"'
        output = subprocess.check_output(['bash','-c', bash_command])
        i += 1

print("Finished.")
