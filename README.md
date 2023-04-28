# How to download Fastq.gz Files from Illumina BaseSpace to Linux Server

This script is a useful tool for anyone who wants to download sequence data from BaseSpace to a Linux server through the terminal, instead of using their browser.

## How to download and authenticate BaseSpace Sequence Hub CLI

1. Log into the server and create a directory called "illumina_basespace" in the "tools" folder (or any other folder where you normally save software).

    ```
    ssh username@vacc-user1.uvm.edu # provide password when prompted
    cd tools
    mkdir illumina_basespace
    cd illumina_basespace
    ```

2. Download the BaseSpace Sequence Hub CLI into the chosen directory.

    **Note:** Be sure to use the correct link to download the latest version for Linux.

    ```
    wget "https://launch.basespace.illumina.com/CLI/latest/amd64-linux/bs" -o bs
    ```

3. While not necessary, it's a good idea to make the "bs" file executable just in case your server requires it.

    ```
    chmod u+x bs
    ```

4. Now, we need to authenticate with BaseSpace. Run the following command to receive a URL that will authenticate your server:

    ```
    /username/tools/illumina_basespace/bs auth
    ```

    Copy and paste the URL into your web browser and follow the prompts to complete authentication.

You're now ready to download Fastq.gz files from BaseSpace to your Linux server using the command line.

## How to Download Fastq.gz Files Directly to Your Server

To download fastq.gz files from your BaseSpace account directly to your server, follow these steps:

1. List all of your projects on your BaseSpace account by running the following command: 

```
/username/tools/illumina_basespace/bs list projects
```

Take note of the IDs listed, as you will need them for the next command.

2. Create/navigate to the folder where you want to download the fastq.gz files:

```
cd data
mkdir <Project Name>
cd <Project Name>
```

3. The most important step is to run the following command, replacing `<ID>` with the specific ID of your project:

```
/username/tools/illumina_basespace/bs download project -i <ID> --extension=fastq.gz
```

This will start the download process. Keep in mind that the download may take some time depending on the file size.

By following these steps, you can easily download fastq.gz files from your BaseSpace account directly to your server. Happy downloading!