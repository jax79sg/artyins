[![ARTYINS Architecture](https://github.com/jax79sg/artyins/raw/master/SoftwareArchitecture.jpg)]

# ARTYINS architecture
This is the main module for the ARTYINS architecture. 

[Database](https://github.com/jax79sg/artyins-database)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-database.svg?branch=master)](https://travis-ci.com/jax79sg/artyins-database)

[Job Service](https://github.com/jax79sg/artyins-jobservice)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-jobservice.svg?branch=master)](https://travis-ci.com/jax79sg/artyins-jobservice)
[![Container Status](https://quay.io/repository/jax79sg/artyins-jobservice/status)](https://quay.io/repository/jax79sg/artyins-jobservice)

[Extraction Service](https://github.com/jax79sg/artyins-extractionservice)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-extractionservice.svg?branch=master)](https://travis-ci.com/jax79sg/artyins-extractionservice)
[![Container Status](https://quay.io/repository/jax79sg/artyins-extractionservice/status)](https://quay.io/repository/jax79sg/artyins-extractionservice)

[Classifier Service](https://github.com/jax79sg/artyins-classifierservice)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-classifierservice.svg?token=BREzYzgtHGHQp4of21Xp&branch=master)](https://travis-ci.com/jax79sg/artyins-classifierservice)
[![Container Status](https://quay.io/repository/jax79sg/artyins-classifierservice/status)](https://quay.io/repository/jax79sg/artyins-classifierservice)

[Saver Service](https://github.com/jax79sg/artyins-saveservice)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-saveservice.svg?branch=master)](https://travis-ci.com/jax79sg/artyins-saveservice)
[![Container Status](https://quay.io/repository/jax79sg/artyins-saveservice/status)](https://quay.io/repository/jax79sg/artyins-saveservice)

[Monitor Service](https://github.com/jax79sg/artyins-monitor)
- [![Build Status](https://travis-ci.com/jax79sg/artyins-monitor.svg?branch=master)](https://travis-ci.com/jax79sg/artyins-monitor)
[![Container Status](https://quay.io/repository/jax79sg/artyins-monitor/status)](https://quay.io/repository/jax79sg/artyins-monitor)
---

## Table of Contents 

- [Installation](#Installation)
- [Features](#features)

---

## Installation
The general idea is as follows
1. Either download the pre-made docker images or build the docker images yourself
2. Clone this project
2. Transfer this project and the docker images to a non-internet connected environment.
3. Run docker-compose up

### 1a: Downloading pre-made docker images. Internet required.
All docker images are available in quay.io/jax79sg/. You may run the following commands to download the images. After running the commands, you should see docker images such as artyins-database, artyins-jobservice..etc in your local docker repository.
```bash
docker pull quay.io/jax79sg/artyins-database
docker tag quay.io/jax79sg/artyins-database artyins-database
docker pull quay.io/jax79sg/artyins-jobservice
docker tag quay.io/jax79sg/artyins-jobservice artyins-jobservice
docker pull quay.io/jax79sg/artyins-extractionservice
docker tag quay.io/jax79sg/artyins-extractionservice artyins-extractionservice
docker pull quay.io/jax79sg/artyins-classifierservice
docker tag quay.io/jax79sg/artyins-classifierservice artyins-classifierservice
docker pull quay.io/jax79sg/artyins-saveservice
docker tag quay.io/jax79sg/artyins-saveservice artyins-saveservice
docker pull quay.io/jax79sg/artyins-monitor
docker tag quay.io/jax79sg/artyins-monitor artyins-monitor
docker pull mysql:5.7
```

### 1b: Rebuilding the images. Internet required
Alternatively, you may rebuild the images from scratch. After running the commands, you should see docker images such as artyins-database, artyins-jobservice..etc in your local docker repository.
```bash
git clone https://github.com/jax79sg/artyins-database
git clone https://github.com/jax79sg/artyins-jobservice
git clone https://github.com/jax79sg/artyins-extractionservice
git clone https://github.com/jax79sg/artyins-classifierservice
git clone https://github.com/jax79sg/artyins-saveservice
git clone https://github.com/jax79sg/artyins-monitor

cd /artyins-jobservice
./rebuild.sh
cd ../artyins-extractionservice
./rebuild.sh
cd ../artyins-jobservice
./rebuild.sh
cd ../artyins-classifierservice
./rebuild.sh
cd ../artyins-saveservice
./rebuild.sh
cd ../artyins-monitor
./rebuild.sh
```
### Transfer to offline env
Copying to USB Drive, assuming that the USB disk is on /media/myusbdrive
```bash
git clone https://github.com/jax79sg/artyin
cp -r artyin /media/myusbdrive/

docker save mysql:5.7 -o /media/myusbdrive/mysql.tar
docker save artyins-jobservice -o /media/myusbdrive/artyins-jobservice.tar
docker save artyins-extractionservice -o /media/myusbdrive/artyins-extractionservice.tar
docker save artyins-classifierservice -o /media/myusbdrive/artyins-classifierservice.tar
docker save artyins-saveservice -o /media/myusbdrive/artyins-saveservice.tar
docker save artyins-monitor -o /media/myusbdrive/artyins-monitor.tar
```

Copying to the offline computer
```bash
cp -r /media/myusbdrive/* /home/user/
```

### Running the application
Upon running the following commands, you will see scrolling logs.
```bash
cd /home/user/artyin
./runartyins.sh
```

### Using the application
The users can simply copy their raw reports in PDF into the `/home/user/artyins/shareddata/new` folder. <br>
When the system pick up the files, it will be moved into the `/home/user/artyins/shareddata/processing` folder <br>
Depending on outcomes, the file will eventually be moved to `/home/user/artyins/shareddata/success` or `/home/user/artyins/shareddata/fail` folders.

All results can be accessed via the mysqldb exposed under port 3306, with following parameters.
```python
username='user'
password='password'
database='reportdb'
tables = 'reports', 'ingests'
```
More information on the database schema can be found in http://github.com/jax79sg/artyins-database#schema
---

## Virtual Environment
`python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt`

## Usage 
## Documentation 
## Tests 

---

