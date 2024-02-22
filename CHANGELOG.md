## [1.2.2](https://github.com/implicit-invocation/runpod-worker-comfy/compare/1.2.1...1.2.2) (2024-02-22)


### Bug Fixes

* secret again ([52c6080](https://github.com/implicit-invocation/runpod-worker-comfy/commit/52c6080f8964a5c676dcdcd5b6c86f488a90a0e5))

## [1.2.1](https://github.com/implicit-invocation/runpod-worker-comfy/compare/1.2.0...1.2.1) (2024-02-22)


### Bug Fixes

* civitai secret ([ea85195](https://github.com/implicit-invocation/runpod-worker-comfy/commit/ea8519508ff3ff0732e20a1130d41e2e9ce4c147))

# [1.2.0](https://github.com/implicit-invocation/runpod-worker-comfy/compare/1.1.0...1.2.0) (2024-02-22)


### Features

* fix ([ef6b09c](https://github.com/implicit-invocation/runpod-worker-comfy/commit/ef6b09c39eb29ca90bbaa3daadf81774dffa050a))

# [1.1.0](https://github.com/implicit-invocation/runpod-worker-comfy/compare/1.0.0...1.1.0) (2024-02-22)


### Features

* dummy ([73c3a7e](https://github.com/implicit-invocation/runpod-worker-comfy/commit/73c3a7eb174bff50cbc2acb177e1eda5a510a7cc))

# 1.0.0 (2024-02-22)


### Bug Fixes

* don't run ntpdate as this is not working in GitHub Actions ([2f7bd3f](https://github.com/implicit-invocation/runpod-worker-comfy/commit/2f7bd3f71f24dd3b6ecc56f3a4c27bbc2d140eca))
* got rid of syntax error ([c04de4d](https://github.com/implicit-invocation/runpod-worker-comfy/commit/c04de4dea93dbe586a9a887e04907b33597ff73e))
* path should be "loras" and not "lora" ([8e579f6](https://github.com/implicit-invocation/runpod-worker-comfy/commit/8e579f63e18851b0be67bff7a42a8e8a46223f2b))
* return the output of "process_output_image" and access jobId correctly ([#11](https://github.com/implicit-invocation/runpod-worker-comfy/issues/11)) ([dc655ea](https://github.com/implicit-invocation/runpod-worker-comfy/commit/dc655ea0dd0b294703f52f6017ce095c3b411527))
* **semantic-release:** added .releaserc ([#21](https://github.com/implicit-invocation/runpod-worker-comfy/issues/21)) ([12b763d](https://github.com/implicit-invocation/runpod-worker-comfy/commit/12b763d8703ce07331a16d4013975f9edc4be3ff))
* updated path to "comfyui" ([37f66d0](https://github.com/implicit-invocation/runpod-worker-comfy/commit/37f66d04b8c98810714ffbc761412f3fcdb1d861))


### Features

* added default ComfyUI workflow ([fa6c385](https://github.com/implicit-invocation/runpod-worker-comfy/commit/fa6c385e0dc9487655b42772bb6f3a5f5218864e))
* added runpod as local dependency ([9deae9f](https://github.com/implicit-invocation/runpod-worker-comfy/commit/9deae9f5ec723b93540e6e2deac04b8650cf872a))
* added unit tests for everthing, refactored the code to make it better testable, added test images ([a7492ec](https://github.com/implicit-invocation/runpod-worker-comfy/commit/a7492ec8f289fc64b8e54c319f47804c0a15ae54))
* added xl_more_art-full_v1, improved comments ([9aea8ab](https://github.com/implicit-invocation/runpod-worker-comfy/commit/9aea8abe1375f3d48aa9742c444b5242111e3121))
* base64 image output ([#8](https://github.com/implicit-invocation/runpod-worker-comfy/issues/8)) ([76bf0b1](https://github.com/implicit-invocation/runpod-worker-comfy/commit/76bf0b166b992a208c53f5cb98bd20a7e3c7f933))
* example on how to configure the .env ([4ed5296](https://github.com/implicit-invocation/runpod-worker-comfy/commit/4ed529601394e8a105d171ab1274737392da7df5))
* image-input, renamed "prompt" to "workflow", added "REFRESH_WORKER" ([#14](https://github.com/implicit-invocation/runpod-worker-comfy/issues/14)) ([5f5e390](https://github.com/implicit-invocation/runpod-worker-comfy/commit/5f5e390dfda9d3ef8ce9b5578aade1bee600bf5c))
* logs should be written to stdout so that we can see them inside the worker ([fc731ff](https://github.com/implicit-invocation/runpod-worker-comfy/commit/fc731fffcd79af67cf6fcdf6a6d3df6b8e30c7b5))
* run the worker locally ([#19](https://github.com/implicit-invocation/runpod-worker-comfy/issues/19)) ([34eb32b](https://github.com/implicit-invocation/runpod-worker-comfy/commit/34eb32b72455e6e628849e50405ed172d846d2d9))
* simplified input ([35c2341](https://github.com/implicit-invocation/runpod-worker-comfy/commit/35c2341deca346d4e6df82c36e101b7495f3fc03))
* simplified input to just have "prompt", removed unused code ([0c3ccda](https://github.com/implicit-invocation/runpod-worker-comfy/commit/0c3ccda9c5c8cdc56eae829bb358ceb532b36371))
* updated path to "comfyui", added "ntpdate" to have the time of the container in sync with AWS ([2fda578](https://github.com/implicit-invocation/runpod-worker-comfy/commit/2fda578d62460275abec11d6b2fbe5123d621d5f))
* use local ".env" to load env variables, mount "comfyui/output" to localhost so that people can see the generated images ([aa645a2](https://github.com/implicit-invocation/runpod-worker-comfy/commit/aa645a233cd6951d296d68f7ddcf41b14b3f4cf9))
* use models from huggingface, not from local folder ([b1af369](https://github.com/implicit-invocation/runpod-worker-comfy/commit/b1af369bb577c0aaba8875d8b2076e1888356929))
* wait until server is ready, wait until image generation is done, upload to s3 ([ecfec13](https://github.com/implicit-invocation/runpod-worker-comfy/commit/ecfec1349da0d04ea5f21c82d8903e1a5bd3c923))

# [2.1.0](https://github.com/blib-la/runpod-worker-comfy/compare/2.0.0...2.1.0) (2024-02-12)


### Bug Fixes

* **semantic-release:** added .releaserc ([#21](https://github.com/blib-la/runpod-worker-comfy/issues/21)) ([12b763d](https://github.com/blib-la/runpod-worker-comfy/commit/12b763d8703ce07331a16d4013975f9edc4be3ff))


### Features

* run the worker locally ([#19](https://github.com/blib-la/runpod-worker-comfy/issues/19)) ([34eb32b](https://github.com/blib-la/runpod-worker-comfy/commit/34eb32b72455e6e628849e50405ed172d846d2d9))

#  (2023-11-18)



## [1.1.1](https://github.com/blib-la/runpod-worker-comfy/compare/1.1.0...1.1.1) (2023-11-17)


### Bug Fixes

* return the output of "process_output_image" and access jobId correctly ([#11](https://github.com/blib-la/runpod-worker-comfy/issues/11)) ([dc655ea](https://github.com/blib-la/runpod-worker-comfy/commit/dc655ea0dd0b294703f52f6017ce095c3b411527))



# [1.1.0](https://github.com/blib-la/runpod-worker-comfy/compare/1.0.0...1.1.0) (2023-11-17)


### Bug Fixes

* path should be "loras" and not "lora" ([8e579f6](https://github.com/blib-la/runpod-worker-comfy/commit/8e579f63e18851b0be67bff7a42a8e8a46223f2b))


### Features

* added unit tests for everthing, refactored the code to make it better testable, added test images ([a7492ec](https://github.com/blib-la/runpod-worker-comfy/commit/a7492ec8f289fc64b8e54c319f47804c0a15ae54))
* added xl_more_art-full_v1, improved comments ([9aea8ab](https://github.com/blib-la/runpod-worker-comfy/commit/9aea8abe1375f3d48aa9742c444b5242111e3121))
* base64 image output ([#8](https://github.com/blib-la/runpod-worker-comfy/issues/8)) ([76bf0b1](https://github.com/blib-la/runpod-worker-comfy/commit/76bf0b166b992a208c53f5cb98bd20a7e3c7f933))



# [1.0.0](https://github.com/blib-la/runpod-worker-comfy/compare/ecfec1349da0d04ea5f21c82d8903e1a5bd3c923...1.0.0) (2023-10-12)


### Bug Fixes

* don't run ntpdate as this is not working in GitHub Actions ([2f7bd3f](https://github.com/blib-la/runpod-worker-comfy/commit/2f7bd3f71f24dd3b6ecc56f3a4c27bbc2d140eca))
* got rid of syntax error ([c04de4d](https://github.com/blib-la/runpod-worker-comfy/commit/c04de4dea93dbe586a9a887e04907b33597ff73e))
* updated path to "comfyui" ([37f66d0](https://github.com/blib-la/runpod-worker-comfy/commit/37f66d04b8c98810714ffbc761412f3fcdb1d861))


### Features

* added default ComfyUI workflow ([fa6c385](https://github.com/blib-la/runpod-worker-comfy/commit/fa6c385e0dc9487655b42772bb6f3a5f5218864e))
* added runpod as local dependency ([9deae9f](https://github.com/blib-la/runpod-worker-comfy/commit/9deae9f5ec723b93540e6e2deac04b8650cf872a))
* example on how to configure the .env ([4ed5296](https://github.com/blib-la/runpod-worker-comfy/commit/4ed529601394e8a105d171ab1274737392da7df5))
* logs should be written to stdout so that we can see them inside the worker ([fc731ff](https://github.com/blib-la/runpod-worker-comfy/commit/fc731fffcd79af67cf6fcdf6a6d3df6b8e30c7b5))
* simplified input ([35c2341](https://github.com/blib-la/runpod-worker-comfy/commit/35c2341deca346d4e6df82c36e101b7495f3fc03))
* simplified input to just have "prompt", removed unused code ([0c3ccda](https://github.com/blib-la/runpod-worker-comfy/commit/0c3ccda9c5c8cdc56eae829bb358ceb532b36371))
* updated path to "comfyui", added "ntpdate" to have the time of the container in sync with AWS ([2fda578](https://github.com/blib-la/runpod-worker-comfy/commit/2fda578d62460275abec11d6b2fbe5123d621d5f))
* use local ".env" to load env variables, mount "comfyui/output" to localhost so that people can see the generated images ([aa645a2](https://github.com/blib-la/runpod-worker-comfy/commit/aa645a233cd6951d296d68f7ddcf41b14b3f4cf9))
* use models from huggingface, not from local folder ([b1af369](https://github.com/blib-la/runpod-worker-comfy/commit/b1af369bb577c0aaba8875d8b2076e1888356929))
* wait until server is ready, wait until image generation is done, upload to s3 ([ecfec13](https://github.com/blib-la/runpod-worker-comfy/commit/ecfec1349da0d04ea5f21c82d8903e1a5bd3c923))
