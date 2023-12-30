#!/bin/bash
# https://stackoverflow.com/questions/29116212/split-a-folder-into-multiple-subfolders-in-terminal-bash-script
#Rotate images 90 degrees counterclockwise
#for szFile in ~/Downloads/IndoorDataset1/*.jpg;
#do
#	convert "$szFile" -rotate 270 ~/Downloads/IndoorDatasetJPG2/"$(basename "$szFile")";
#done

# i is the iterator


dir_size=24;
# dir_original is the raw data folder of all .heic images
dir_original="DatasetJPG1";
# dir_name must be new folder name
dir_name="Final7525";
n=$((`find . -maxdepth 1 -type f | wc -l`/$dir_size));
#i_train=(0 2 3 5 6 8 9 11);
two_train=(0 1 2 4 5 6 7 9 11 12 13 14 16 17 18 19 21 23);
three_train=(0 1 3 4 6 7 8 9 11 12 14 15 16 17 19 20 21 23);
#i_test=(1 4 7 10);
two_test=(3 8 10 15 20 22);
three_test=(2 5 10 13 18 22);

three_way=(9 14 15 18 23);


# Convert HEIC to JPG
#cd ~/Downloads/"$dir_original";
#for f in *.HEIC;
#do
#        heif-convert -q 100 $f $f.jpg;
#done
#echo "HEIC to JPG";

# Rotate JPG images to upright
#for szFile in ~/Downloads/"$dir_original"/*.jpg;
#do
#       convert "$szFile" -rotate 270 ~/Downloads/DatasetJPG/"$(basename "$szFile")";
#done

cd ~/Downloads/"$dir_original";

mkdir -p ~/Downloads/"$dir_name";
chmod 777 ~/Downloads/"$dir_name";
for i in *.jpg
do
        mv "$i" ~/Downloads/"$dir_name";
done
echo "JPG folder created";

# First split the files into classes based on location (12 photos)
#echo ${n};
cd ~/Downloads/"$dir_name";
for i in `seq 1 24`;
do
	mkdir -p ~/Downloads/"$dir_name"/"$i";
	chmod 777 ~/Downloads/"$dir_name"/"$i";
#	echo "Check 1";
	find . -maxdepth 1 -type f | sort | head "-$dir_size" | xargs -i mv "{}" "$i";
#	echo "Check 2";
done
echo "Class Split";
iter1=1;
for i in `seq 1 24`;
do
	# Next split files into train and test
	cd ~/Downloads/"$dir_name"/"$i";
	mkdir -p ~/Downloads/"$dir_name"/"$i"/train;
	chmod 777 ~/Downloads/"$dir_name"/"$i"/train;
	mkdir -p ~/Downloads/"$dir_name"/"$i"/tests;
	chmod 777 ~/Downloads/"$dir_name"/"$i"/tests;
	iter=0;

	#this line needs to stop at 12 images
	for a in *.jpg;
	do
		if [[ " ${three_way[*]} " =~ " ${iter1} " ]];
		then
			echo "three way";
			if [[ " ${three_train[*]} " =~ " ${iter} " ]];
			then
				mv "$a" ~/Downloads/"$dir_name"/"$i"/train;
			else
				mv "$a" ~/Downloads/"$dir_name"/"$i"/tests;
			fi
			((iter++))
		else
                        if [[ " ${two_train[*]} " =~ " ${iter} " ]];
                        then
                                mv "$a" ~/Downloads/"$dir_name"/"$i"/train;
                        else
                                mv "$a" ~/Downloads/"$dir_name"/"$i"/tests;
                        fi
                        ((iter++))
		
		fi
	done
	((iter1++))
	cd ~/Downloads/"$dir_name";
done
echo "Train/Test Split";


name=(AE1 AE2 AA1 AA2 AA3 AA4 AA5 AA6 AC11 S11 S12 S13 BC11 BC12 BC13 BC14 BC15 BC16 BC21 BC22 BC23 BC24 BC31 BC32)
count=0
cd ~/Downloads/"$dir_name";
for dir in $(ls | sort -n);
do
        mv "${dir}" "${name[count]}";

        ((count++))
done
echo "Rename class folders";


cp -R ~/Downloads/"$dir_name" ~/Downloads/TEST
chmod 777 ~/Downloads/TEST
echo "Test Folder created"
mv ~/Downloads/"$dir_name" ~/Downloads/TRAIN
chmod 777 ~/Downloads/TRAIN
echo "Train Folder renamed"

cd ~/Downloads/TRAIN
name="tests"
for dir in *;
do
        rm -r "${dir}"/"${name}";
done

cd ~/Downloads/TEST
name="train"
for dir in *;
do
	rm -r "${dir}"/"${name}";
done

echo "Completion"


