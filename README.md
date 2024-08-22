# java-base-image

The image was created to create an minimal Redhat openjdk 21 image. 
The image is hardened to remove all non-required packages, like python.

All CNL java based images are dependent on this base image.

## Build

Use the following command to add it to our local repository.

``docker build -t "ghcr.io/competentnl/java-base-image" .``