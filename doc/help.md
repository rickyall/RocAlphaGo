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
def _neighbors(self, position):
  """返回一个子的临近位置
  """
def _diagonals(self, position):
  """返回对角线的子的位置
  """
def _update_neighbors(self, position):
  """当下一个子后，更新临近的子的临近子
  """
def _update_hash(self, action, color):
  """更新棋盘状态
  args:
    action -- 下棋的位置
    color -- 下棋的颜色
  """
def _remove_group(self, group):
  """将一个被吃的棋子组从棋盘上移除，更新移除组的信息，和移除组临近的信息
  """
def copy(self):
  """复制游戏的状态
  """
def is_suicide(self, action):
  """判断落子是不是自杀型的
  """
def is_positional_superko(self, action):
  """禁止同一起手走出和前面一样的盘面
  """
def is_legal(self, action):
  """判断当前的走子是否是合法的，只判断劫
  """
def is_eyeish(self, position, owner):
  """判断当前的子是不是眼
  """
def is_eye(self, position, owner, stack=[]):
  """判断当前的位置是不是执手的真眼
  """
def is_ladder_capture(self, action, prey=None, remaining_attempts=80):
  """
  """
def is_ladder_escape(self, action, prey=None, remaining_attempts=80):
  """判断当前落子是不是逃脱了征子
  """

def get_legal_moves(self, include_eyes):
  """获取合法的落子位置
  """

def get_winner(self):
  """计算盘面的分数，返回谁获胜
  """
def place_handicaps(self, actions):
  """添加劫的位置
  """
def get_current_player(self):
  """获取当前的玩家
  """
def do_move(self, action, color=None):
  """在（x, y）落一子
  """
```

# 棋盘特征预处理
位置： /AlphaGo/preprocessing/preprocessing

## 方法
```python
def get_board(state):
  """特征1：将棋盘上的子划分为己方、对方、空的子，并返回一个三维的矩阵
  """

def get_turns_since(state, maximum=8):
  """特征2：计算每个位置子的寿命，并获取一个三维的矩阵
  """

def get_liberties(state, maximum=8):
  """特征3：计算每个位置子的气
  """
```


# MCTS 蒙特卡洛树模拟算法
位置：/AlphaGo/mcts.py

## **TreeNode**
此接口提供蒙特卡洛树搜索的算法

1）初始输入参数



































1
