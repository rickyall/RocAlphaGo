# 棋盘接口
位置：/AlphaGo/go.py

## **GameState**

描述：此对象提供基本的棋盘盘面和一个操作函数接口

1)初始输入参数
* size: 棋盘的大小，一般是19*19
* komi: 贴目，指黑方由于先手，在布局上占有一定的优势，为了公平起见，在最后计算双方所占地的多少时，黑棋必须扣减一定的目数或子数，一般为7.5
* enforce_superko: 是否强制大劫

2）初始参数
* board: 盘面，是19*19的矩阵，初始都为0
* size: 同上
* current_player: 当前执手方，黑棋先走
* ko: 打劫数
* komi: 同上
* handicaps: 泛指包括让子和贴目等形式在内的指导棋,数组
* num_black_prisoners:
* num_white_prisoners:
* is_end_of_game: 判断本局是否结束
* passes_white:
* passes_black:
* liberty_sets: 是一个二维的数组，每个点对应一个tuples,可以缓存棋盘的状态，提高一些函数的速度
* liberty_counts: 是一个棋盘大小的二维数组，用来缓存次数
* group_sets: 记录每个点相邻的所有同颜色的子的位置集合
* stone_ages: 记录每个眼存活的时间
* enforce_superko: 是否强制大劫
* hash_lookup:
* current_hash: 当前棋盘的状态
* previous_hashes: 之前所有棋盘状态的集合

3)方法
``` python
def get_group(self, position):
  """获取指定位置的相连的同样颜色的子的位置
  args:
      position -- 子的坐标
  return:
      返回一个tuples包含相邻的所有同颜色的子的位置
  """

def get_groups_around(self, position):
  """获取一个子周围连续的子的集合
  args:
    position -- 子的坐标
  return:
    返回一个数组
  """
def _on_board(self, position):
  """判断一个子是否是在棋盘内
  args:
    position -- 子的坐标
  returns:
    返回一个boolen值
  """
def _create_neighbors_cache(self):
  """创建临近的缓存
  """
```
