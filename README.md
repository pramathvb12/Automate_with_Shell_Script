# Automate_with_Shell_Script

**Automating with Shell Scripting**

**Learning Objectives:**
Understand what a shell script is
Learn how automate an analytical workflow
Understand the different steps involved in variant calling
Use a series of command line tools to execute a variant calling workflow
Becoming familiar with data formats encountered during variant calling


What is a shell script?
A shell script is basically a text file that contains a list of commands that are executed sequentially. The commands in a shell script are the same as you would use on the command line.

Once you have worked out the details and tested your commands in the shell, you can save them into a file so, the next time, you can automate the process with a script.

The basic anatomy of a shell script is a file with a list of commands. That is also the definition of pretty much any computer program.


###################################
!/bin/bash

cd ~/dc_sample_data

for file in untrimmed_fastq/*.fastq
do
  echo "My file name is $file"
done

###################################


This looks a lot like the for loops we saw earlier. In fact, it is no different, apart from using indentation and the lack of the '>' prompts; it's just saved in a text file. The line at the top ('#!/bin/bash') is commonly called the shebang line, which is a special kind of comment that tells the shell which program is to be used as the 'intepreter' that executes the code.

In this case, the interpreter is bash, which is the shell environment we are working in. The same approach is also used for other scripting languages such as perl and python.


**How to run a shell script**

There are two ways to run a shell script the first way is to specify the interpreter (bash) and the name of the script. By convention, shell script use the .sh extension, though this is not enforced.

$ bash myscript.sh
My file name is untrimmed_fastq/SRR097977.fastq
My file name is untrimmed_fastq/SRR098026.fastq
The second was is a little more complicated to set up.

The first step, which only needs to be done once, is to modify the file 'permissions' of the text file so that the shell knows the file is executable.

$ chmod +x myscript.sh
After that, you can run the script as a regular program by just typing it's name on the command line.

$ ./myscript.sh
My file name is untrimmed_fastq/SRR097977.fastq
My file name is untrimmed_fastq/SRR098026.fastq
The thing about running programs on the command line is that the shell may not know the location of your executables unless they are in the 'path' of know locations for programs. So, you need to tell the shell the path to your script, which is './' if it is in the same directory.


**A real shell script**

Now, let's do something real. First, recall the code from our our fastqc workflow from this morning, with a few extra "echo" statements.

######################################

cd ~/dc_workshop/data/untrimmed_fastq/

echo "Running fastqc..."
~/FastQC/fastqc *.fastq
mkdir -p ~/dc_workshop/results/fastqc_untrimmed_reads

echo "saving..."
mv *.zip ~/dc_workshop/results/fastqc_untrimmed_reads/
mv *.html ~/dc_workshop/results/fastqc_untrimmed_reads/

cd ~/dc_workshop/results/fastqc_untrimmed_reads/

echo "Unzipping..."
for zip in *.zip
do
  unzip $zip
done

echo "saving..."

cat */summary.txt > ~/dc_workshop/docs/fastqc_summaries.txt

##########################################

**Setting up**

To get started with this lesson, make sure you are in dc_workshop. Now let's copy over the reference data required for alignment:

############################################


$ cd ~/dc_workshop
$ cp -r ~/.dc_sampledata_lite/ref_genome/ data/
Your directory structure should now look like this:

dc_workshop
├── data
    ├── ref_genome
        └── ecoli_rel606.fasta
    ├── untrimmed_fastq
    └── trimmed_fastq
        ├── SRR097977.fastq
        ├── SRR098026.fastq
        ├── SRR098027.fastq
        ├── SRR098028.fastq
        ├── SRR098281.fastq
        └── SRR098283.fastq
 ├── results
 └── docs

 
############################################


You will also need to create directories for the results that will be generated as part of the workflow:


$ mkdir  results/sai results/sam results/bam results/bcf results/vcf

NOTE: All of the tools that we will be using in this workflow have been pre-installed on our remote computer


