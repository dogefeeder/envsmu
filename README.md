# envsmu
### Create docker image by dockerfile  
docker build -t IMAGENAME .  
### Convert docker image to singularity
docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/output --privileged -t --rm singularityware/docker2singularity IMAGENAME  
### Move it to FOLDERNAME and load singularity
module use FOLDERNAME  
module load load_env.lua
