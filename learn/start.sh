#bin/bash
# phase0:将棋盘数据转换成为神经网络的特征
find ../tests -iname "*Lee-Sedol*.sgf" | python -m AlphaGo.preprocessing.game_converter --features board,ones,turns_since -o data/hdf5/debug_feature_planes.hdf5
# phase1:采用监督学习训练策略网络
python -m AlphaGo.training.supervised_policy_trainer data/model/my_model.json data/hdf5/debug_feature_planes.hdf5 training_results/ --epochs 5 --minibatch 32 --learning-rate 0.01
