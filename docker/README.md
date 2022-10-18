# Build a runnable image

1.To build a runnable image, you need to change $image_name and $final_name in build-docker-image.sh.
image_name means temp image, final_name meas the final runnable image you will get.

2. Change These four parameter proper appropriate in occlum-build.sh.
```bash
-e SGX_MEM_SIZE=12GB \
-e SGX_THREAD=2048 \
-e SGX_HEAP=1GB \
-e SGX_KERNEL_HEAP=1GB
```

3. Run build-docker-image.sh to build, and the image named $final_name will be built.
```bash
bash build-docker-image.sh
```


