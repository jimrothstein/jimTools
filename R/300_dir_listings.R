## PURPOSE:   list files in given directory


dir = "~/code/try_things_here/envir/"

files = list.files(dir)

print(files)
utils::capture.output(file = "dir_listing")
