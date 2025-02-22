# default
export container_name=bigdl-ppml-trusted-big-data-ml-scala-occlum-build
export image_name=xiangyut/bigdl-ppml-azure-occlum:mount
export final_name=xiangyut/bigdl-ppml-azure-occlum:final
while getopts ":c:i:f:" opt
do
    case $opt in
        c)
        export container_name=$OPTARG
        echo "container_name:" $container_name
        ;;
        i)
        export image_name=$OPTARG
        echo "image_name:" $image_name
        ;;
        f)
        export final_name=$OPTARG
        echo "final_name:" $final_name
        ;;
        ?)
        echo $OPTARG
        echo "unknow parameter"
        exit 1;;
    esac
done
#Clean up old
sudo docker rm -f $container_name

# Run new command in container
sudo docker run -it \
        --net=host \
        --name=$container_name \
        --cpuset-cpus 3-5 \
        -e LOCAL_IP=$LOCAL_IP \
        -e SGX_MEM_SIZE=12GB \
        -e SGX_THREAD=2048 \
        -e SGX_HEAP=1GB \
        -e SGX_KERNEL_HEAP=1GB \
        -e PCCS_URL=$PCCS_URL \
        $image_name \
        bash /opt/run_spark_on_occlum_glibc.sh init
echo "build finish"
docker commit $container_name $final_name
