#Create directory for the data
mkdir -p data/tripdata

#Listing only the desired files
docker run --rm -it -v $(pwd):/aws amazon/aws-cli s3 ls "s3://nyc-tlc/trip data/"  --recursive --human-readable --no-sign-request | grep yellow_tripdata_2020

#Copying these files locally
docker run --rm -it -v $(pwd):/aws amazon/aws-cli s3 cp "s3://nyc-tlc/trip data/" .  --recursive --exclude "*" --include "yellow_tripdata_2020*"  --no-sign-request 

#Move files to data/tripdata dir
mv yellow_tripdata_2020* data/tripdata/


#Listing only the desired files
docker run --rm -it -v $(pwd):/aws amazon/aws-cli s3 ls "s3://nyc-tlc/misc/"  --recursive --human-readable --no-sign-request

#Copying these files locally
docker run --rm -it -v $(pwd):/aws amazon/aws-cli s3 cp "s3://nyc-tlc/misc/taxi _zone_lookup.csv" . --no-sign-request 

#Move file to data/ dir
mv "taxi _zone_lookup.csv" data/
