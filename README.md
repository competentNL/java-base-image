# java-base-image

The image was created to create an minimal Redhat openjdk 21 image. 
The image is hardened to remove all non-required packages, like python.

## Build

Use the following command to build one for your local repository.

``docker build -t "ghcr.io/competentnl/java-base-image" .``

