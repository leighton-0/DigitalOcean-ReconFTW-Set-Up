
#!/bin/bash
s1=5                                  # Slows scritpt down so you can see whats going on

apt install wget
apt install git

printf '[+] install reports directory zz_reports\n'

if [ ! -d ~/zz_reports ]; then        #Check if zz_reports dir already exists. If no then creates directory
    mkdir ~/zz_reports                #Need to update the .cfg file to reflect custom save dirrectory (although not wk for me - wip)
fi
sleep $s1

if [ ! -d ~/reconftw ]; then           #Check it Reconftw already exists. If no then loads reconftw program        
    printf '[+] reconftw doesnt exists installing reconftw\n'
    sleep $s1
    git clone https://github.com/six2dez/reconftw
    cd reconftw/
    ./install.sh
fi
printf '[+] reconftw alread exists\n'
sleep $s1
 
#Load custome config file for reconftw and amass. This is over writted each time the this script is run.
  
printf '[+] backing up old .cfg file & install new custom config file\n'
sleep $s1

cp ~/reconftw/reconftw.cfg ~/reconftw/reconftw.cfg.bak; rm -r ~/reconftw/reconftw.cfg
wget -P ~/reconftw https://raw.githubusercontent.com/leighton-0/DigitalOcean-ReconFTW-Set_Up/master/reconftw.cfg
sleep $s1
    
#Load custome config.ini file for amass This is over writted each time the this script is run.
    
printf '[+] backing up old  amass .ini file & install custom .ini file\n'

#cp ~/.config/amass/config.ini ~/.config/amass/config.ini.bak; rm -r ~/.config/amass/config.ini     #legacy
mv ~/.config/amass/config.ini ~/.config/amass/config.ini.bak
wget -P ~/.config/amass/ https://raw.githubusercontent.com/leighton-0/DO/master/config.ini
sleep $s1
    
printf '\n============================================================\n'
printf '[+] REMEMBER TO UPLOAD THE .env FILE CONTAINING api keys \n'
printf '[+] The empty .env file is created here\n'
printf '[+] The script to  run the .env file is upladed to the \s\n'
printf '============================================================\n\n'
mkdir ~/.env
upload script to run .env  <<=====
remember to source it   <<====

mkdir ~/reconftw/.env           # Place all API & secret keys in here

printf '[+] The script to  run the .env file is upladed here\n'
wget -P ~/reconftw https://raw.githubusercontent.com/leighton-0/DigitalOcean-ReconFTW-Set_Up/master/setenv.sh.git
chmod +X setenv.sh
source setenv.sh
./ setenv.sh
   
   
# COMMENT BLOCK STARTS ====================
if (1 == 0); then
--------------------------
To set up a file containing all your api and other "secret keys" do the following.
create a file called env.txt
the first entry is(for testing)
    FIRST_NAME=Agnes
    LAST_NAME=Obel
copy all the api and other key to be read by reconftw (both config.ini and config.cfg) into it.
For security i keep this on my local drive - not on github.
After installation of reconftw I manually copy this env.txt file into the reconftw directory.
There is probably a secure of doing this automatically - its on the TD list
Next
Create a script called <setenv.sh>.
Copy the following into it
    #!/bin/bash
    # Show env vars
    grep -v '^#' .env

    # Export env vars
    export $(grep -v '^#' .env | xargs)
chmod +X setenv.sh
source setenv.sh

confirm env vars is working do below
    echo "${FIRST_NAME} ${LAST_NAME}"
should return.
FIRST_NAME=Agnes
LAST_NAME=Obel

NOTE;
You need to reference all api key environmentl variavbes in both the ini and cfg files

-------------------------------
fi
# COMMENT BLOCK ENDS ============================

   
#./reconftw.sh -d target.com -r

