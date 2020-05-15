#!/bin/bash
# PowerPanel Integration Script
CUSTOM_INSTALL_NAME="ECX Systems"
CIMITRA_SERVER_DIRECTORY="/var/opt/cimitra/server"
BRANDING_DIRECTORY="${CIMITRA_SERVER_DIRECTORY}/branding"
ICONS_DIRECTORY="${BRANDING_DIRECTORY}/icons"
# YAML Files
DOCKER_COMPOSE_YML_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-ecx/master/docker-compose.yml"
DOCKER_COMPOSE_YML_444_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-ecx/master/docker-compose-444.yml"

# IMAGE FILES
PNG_DOWNLOAD_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-ecx/master/ecx.png"
SVG_DOWNLOAD_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-ecx/master/ecx.svg"


function CUSTOM_PRE_INSTALL()
{
sudo mkdir -p ${BRANDING_DIRECTORY} 

sudo mkdir -p ${ICONS_DIRECTORY} 

sudo test -d ${BRANDING_DIRECTORY}

declare -i BRANDING_DIRECTORY_EXISTS=`echo $?`

if [ $BRANDING_DIRECTORY_EXISTS -ne 0 ]
then
return 1
fi

cd ${BRANDING_DIRECTORY} 2> /dev/null

sudo curl -LJO ${PNG_DOWNLOAD_FILE} 

sudo curl -LJO ${SVG_DOWNLOAD_FILE} 

sudo cp ./*.svg ${ICONS_DIRECTORY}

sudo cp ./*.png ${ICONS_DIRECTORY}


}

function CUSTOM_POST_INSTALL()
{
echo ""
echo "Thank You For Installing ECX Systems PowerPanel"
echo ""
}