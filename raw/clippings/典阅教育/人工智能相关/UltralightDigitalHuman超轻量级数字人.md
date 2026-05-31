# Ultralight Digital Human  超轻量级数字人

[https://github.com/anliyuan/Ultralight-Digital-Human?tab=readme-ov-file](https://github.com/anliyuan/Ultralight-Digital-Human?tab=readme-ov-file)

<font style="color:rgb(31, 35, 40);">A Ultralight Digital Human model can run on mobile devices in real time!!!  
</font><font style="color:rgb(31, 35, 40);">一个超轻量级数字人模型可以在移动设备上实时运行!!!</font>

<font style="color:rgb(31, 35, 40);">一个能在移动设备上实时运行的数字人模型,据我所知，这应该是第一个开源的如此轻量级的数字人模型。</font>

<font style="color:rgb(31, 35, 40);">Lets see the demo.</font><font style="color:rgb(31, 35, 40);">⬇️⬇️⬇️</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">让我们看看演示。</font><font style="color:rgb(31, 35, 40);">⬇️⬇️⬇️</font>

<font style="color:rgb(31, 35, 40);">先来看个demo</font><font style="color:rgb(31, 35, 40);">⬇️⬇️⬇️</font>



## <font style="color:rgb(31, 35, 40);">如果你视频中声音质量比较差的话，效果大概率不会好。声音质量比较差指的是：1）存在难以忽略的噪声。2）在空旷的房间里录制的视频有回音。3）视频人声不清楚。建议录制视频时候使用外接麦克风，不用拍摄设备自带的麦克风。我自己尝试了声音清晰的情况，不论是wenet还是hubert，效果都非常棒。</font>
## <font style="color:rgb(31, 35, 40);">关于流式推理：</font>
<font style="color:rgb(31, 35, 40);">使用流式推理时，建议把静音的图片和对应的关键点放在单独的目录里，img_inference和lms_inference里。</font>

### <font style="color:rgb(31, 35, 40);">！！！！！！建议大家拍摄训练视频的时候前面20秒不说话，但可以做一些小幅度的动作（模拟数字人说话时的动作），这20秒就可以作为流式推理时的素材。！！！！！！</font>
<font style="color:rgb(31, 35, 40);">我在代码里加了一些注释，方便大家二次开发</font>

<font style="color:rgb(31, 35, 40);">因为一般用到流式推理的场景一般对实时性要求比较高，所以这里我只写了wenet作为音频编码器的情况（实测在2080这样的机器上多个并发时每帧音频处理+视频处理耗时10ms以内，需要将模型转为onnx）。并且根据每个人的使用场景不同，重构代码是必须的，所以我没有做太多的代码优化，这里只提供一些思路给大家参考，如果需要用到hubert作为音频编码器，可以参考其他github的项目。至于C++的推理方法。我大致试了一下，当前方法在ios近两年的设备上实时跑是没什么问题的，大家可以根据dihuman_run.py里的逻辑做翻译，我这里现在有一种能让这个模型跑在更多设备上的方法（效率更高，略微牺牲效果），有人在商用，暂时不做开源。如果大家在使用过程中发现什么问题，请提issue，我会尽力维护这个项目。</font>

## <font style="color:rgb(31, 35, 40);">Train</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">训练</font>
<font style="color:rgb(31, 35, 40);">It's so easy to train your own digital human.I will show you step by step.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">训练自己的数字人非常简单。我会一步步演示给你看。</font>

<font style="color:rgb(31, 35, 40);">训练一个你自己的数字人非常简单，我将一步步向你展示。</font>

### <font style="color:rgb(31, 35, 40);">install pytorch and other libs</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">安装 pytorch 和其他库</font>
```plain
conda create -n dh python=3.10
conda activate dh
conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia
conda install mkl=2024.0
pip install opencv-python
pip install transformers
pip install numpy==1.23.5
pip install soundfile
pip install librosa
pip install onnxruntime
```

<font style="color:rgb(31, 35, 40);">I only ran on pytorch==1.13.1, Other versions should also work.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">我只在 pytorch==1.13.1 上运行，其他版本也应该可以。</font>

<font style="color:rgb(31, 35, 40);">我是在1.13.1版本的pytorch跑的，其他版本的pytorch应该也可以。</font>

<font style="color:rgb(31, 35, 40);">Download wenet encoder.onnx from</font><font style="color:rgb(31, 35, 40);"> </font>[<font style="color:rgb(9, 105, 218);">https://drive.google.com/file/d/1e4Z9zS053JEWl6Mj3W9Lbc9GDtzHIg6b/view?usp=drive_link</font>](https://drive.google.com/file/d/1e4Z9zS053JEWl6Mj3W9Lbc9GDtzHIg6b/view?usp=drive_link)<font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">从 https://drive.google.com/file/d/1e4Z9zS053JEWl6Mj3W9Lbc9GDtzHIg6b/view?usp=drive_link 下载 wenet encoder.onnx</font>

<font style="color:rgb(31, 35, 40);">and put it in data_utils/</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">并将其放在 data_utils/目录下</font>

### <font style="color:rgb(31, 35, 40);">Data preprocessing</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">数据预处理</font>
<font style="color:rgb(31, 35, 40);">Prepare your video, 3~5min is good. Make sure that every frame of the video has the person's full face exposed and the sound is clear without any noise, put it in a new folder.I will provide a demo video.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">准备你的视频，3~5 分钟为佳。确保视频的每一帧都完全显示人物面部，声音清晰无杂音，并将其放入一个新文件夹。我会提供一个演示视频。</font>

<font style="color:rgb(31, 35, 40);">准备好你的视频，3到5分钟的就可以，必须保证视频中每一帧都有整张脸露出来的人物，声音清晰没有杂音，把它放到一个新的文件夹里面。我会提供一个demo视频，来自康辉老师的口播，侵删。</font>

<font style="color:rgb(31, 35, 40);">First of all, we need to extract audio feature.I'm using 2 different extractor from wenet and hubert, thank them for their great work.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">首先，我们需要提取音频特征。我使用了 wenet 和 hubert 的两个不同提取器，感谢它们的出色工作。</font>

<font style="color:rgb(31, 35, 40);">wenet的代码和与训练模型来自:</font>[<font style="color:rgb(9, 105, 218);">https://github.com/Tzenthin/wenet_mnn</font>](https://github.com/Tzenthin/wenet_mnn)

<font style="color:rgb(31, 35, 40);">首先我们需要提取音频特征，我用了两个不同的特征提取起，分别是wenet和hubert，感谢他们。</font>

<font style="color:rgb(31, 35, 40);">When you using wenet, you neet to ensure that your video frame rate is 20, and for hubert,your video frame rate should be 25.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">使用 wenet 时，你需要确保视频帧率为 20，而 hubert 的视频帧率应为 25。</font>

<font style="color:rgb(31, 35, 40);">如果你选择使用wenet的话，你必须保证你视频的帧率是20fps，如果选择hubert，视频帧率必须是25fps。</font>

<font style="color:rgb(31, 35, 40);">In my experiments, hubert performs better, but wenet is faster and can run in real time on mobile devices.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">在我的实验中，hubert 表现更好，但 wenet 速度更快，可以在移动设备上实时运行。</font>

<font style="color:rgb(31, 35, 40);">在我的实验中，hubert的效果更好，但是wenet速度更快，可以在移动端上实时运行</font>

<font style="color:rgb(31, 35, 40);">And other steps are in data_utils/process.py, you just run it like this.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">其他步骤在 data_utils/process.py 中，你只需要像这样运行它。</font>

<font style="color:rgb(31, 35, 40);">其他步骤都写在data_utils/process.py里面了，没什么特别要注意的。</font>

```plain
cd data_utils
python process.py YOUR_VIDEO_PATH --asr hubert
```

<font style="color:rgb(31, 35, 40);">Then you wait.</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">然后等待。</font>

<font style="color:rgb(31, 35, 40);">然后等它运行完就行了</font>

### <font style="color:rgb(31, 35, 40);">train</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">训练</font>
<font style="color:rgb(31, 35, 40);">After the preprocessing step, you can start training the model.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">预处理步骤完成后，你就可以开始训练模型了。</font>

<font style="color:rgb(31, 35, 40);">上面步骤结束后，就可以开始训练模型了。</font>

<font style="color:rgb(31, 35, 40);">Train a syncnet first for better results.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">先训练一个 syncnet 以获得更好的效果。</font>

<font style="color:rgb(31, 35, 40);">先训练一个syncnet，效果会更好。</font>

```plain
cd ..
python syncnet.py --save_dir ./syncnet_ckpt/ --dataset_dir ./data_dir/ --asr hubert
```

<font style="color:rgb(31, 35, 40);">Then find a best one（low loss） to train digital human model.</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">然后找到一个最好的（低损失）来训练数字人模型。</font>

<font style="color:rgb(31, 35, 40);">然后找一个loss最低的checkpoint来训练数字人模型。</font>

<font style="color:rgb(31, 35, 40);">2025.6.4更新 关于syncnet，看到很多issue里面大家提syncnet写的不对。因为这个项目也没有很明确的指标，在生产中，加不加syncnet对结果影响并不大，视觉上不会看出来什么差异的（在我的大量实验中是这样的）。或者说有没有同学可以提供一个更好的syncnet方法？欢迎PR。</font>

```plain
cd ..
python train.py --dataset_dir ./data_dir/ --save_dir ./checkpoint/ --asr hubert --use_syncnet --syncnet_checkpoint syncnet_ckpt
```

## <font style="color:rgb(31, 35, 40);">inference</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">推理</font>
<font style="color:rgb(31, 35, 40);">Before run inference, you need to extract test audio feature(i will merge this step and inference step), run this</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">在运行推理之前，你需要提取测试音频特征（我将把这个步骤和推理步骤合并），运行这个</font>

<font style="color:rgb(31, 35, 40);">在推理之前，需要先提取测试音频的特征（之后会把这步和推理合并到一起去），运行(音频采样率需要是16000)</font>

```plain
python data_utils/hubert.py --wav your_test_audio.wav  # when using hubert

or

python data_utils/python wenet_infer.py your_test_audio.wav  # when using wenet
```

<font style="color:rgb(31, 35, 40);">then you get your_test_audio_hu.npy or your_test_audio_wenet.npy</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">然后你得到 your_test_audio_hu.npy 或 your_test_audio_wenet.npy</font>

<font style="color:rgb(31, 35, 40);">then run</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">然后运行</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">python inference.py --asr hubert --dataset ./your_data_dir/ --audio_feat your_test_audio_hu.npy --save_path xxx.mp4 --checkpoint your_trained_ckpt.pth</font>

<font style="color:rgb(31, 35, 40);">To merge the audio and the video, run</font><font style="color:rgb(31, 35, 40);">  
</font><font style="color:rgb(31, 35, 40);">要合并音频和视频，运行</font>

<font style="color:rgb(31, 35, 40);background-color:rgb(246, 248, 250);">ffmpeg -i xxx.mp4 -i your_audio.wav -c:v libx264 -c:a aac result_test.mp4</font>

## <font style="color:rgb(31, 35, 40);">Enjoy</font><font style="color:rgb(31, 35, 40);">🎉🎉🎉</font><font style="color:rgb(31, 35, 40);">  </font><font style="color:rgb(31, 35, 40);">享受</font><font style="color:rgb(31, 35, 40);">🎉🎉🎉</font>
<font style="color:rgb(31, 35, 40);">这个模型是支持流式推理的，但是代码还没有完善，之后我会提上来。</font>

<font style="color:rgb(31, 35, 40);">关于在移动端上运行也是没问题的，只需要把现在这个模型通道数改小一点，音频特征用wenet就没问题了。相关代码我也会在之后放上来。</font>



> 更新: 2025-08-15 11:54:28  
> 原文: <https://www.yuque.com/lixinsi/ynhoz5/aagd0zgus9fhoqw3>