###
### $ bash install-(ubuntu-16.04).sh
### or $ ./install-(ubuntu-16.04).sh
###


###ROS Kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
# echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.bashrc
#source ~/.zshrc
source /opt/ros/kinetic/setup.bash
#source /opt/ros/kinetic/setup.zsh
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

rosv=`rosversion -d`
echo "/opt/ros/$rosv/setup.bash"
source "/opt/ros/$rosv/setup.bash"
#echo "/opt/ros/$rosv/setup.zsh"
#source "/opt/ros/$rosv/setup.zsh"

## make a catkin_workspace
mkdir -p robocup/src
cd robocup/src
catkin_init_workspace
cd ..
catkin_make

## Dependencies
sudo apt install  cmake qt5-default libqt5svg5-dev libprotobuf-dev protobuf-compiler libode2-dev screen 
sudo apt install python-qt4 git
## OMPL
sudo apt install cmake
wget http://ompl.kavrakilab.org/install-ompl-ubuntu.sh
chmod u+x install-ompl-ubuntu.sh
./install-ompl-ubuntu.sh
rm ./install-ompl-ubuntu.sh

## Vartypes
mkdir tmpname_noclash && cd tmpname_noclash
wget http://vartypes.googlecode.com/files/vartypes-0.7.tar.gz
tar xfz vartypes-0.7.tar.gz
cd vartypes-0.7
mkdir build && cd build
cmake ..
make 
sudo make install
cd ../../../
rm -rf tmpname_noclash

## Clone the Repo
cd src/
git clone https://github.com/KgpKubs/robocup.git

cd ..
catkin_make --pkg krssg_ssl_msgs

# then make the rest
catkin_make
