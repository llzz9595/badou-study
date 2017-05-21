package com.badou.project;

public class GlobalConsts {
	/**
	 * App用户类型 (1:学生 ;2:教师)
	 * **/
	public static final String DIC_USER_TYPE = "USER_TYPE";
	/**
	 * App用户性别 1 男 2 女
	 * **/
	public static final String DIC_USER_SEX = "USER_SEX";

	/**
	 * 学生年级 (一到六年级)
	 */
	public static final String DIC_GRADE = "STU_GRADE";
	/**
	 * 教师状态 (1:在线 2:忙碌 3:离线)
	 */
	public static final String DIC_STATUS = "TEA_STATUS";

	/**
	 * App学生用户类型 (1:学生 ;2:教师)
	 * 
	 * @value 1 学生
	 * **/
	public static final Integer USER_TYPE_STUDENT = 1;
	/**
	 * App学生用户类型 (1:学生 ;2:教师)
	 * 
	 * @value 2 教师
	 * **/
	public static final Integer USER_TYPE_TEACHER = 2;
	/**
	 * 冻结状态 (1: 正常 2:冻结 )
	 */
	public static final String DIC_USER_STATUS = "USER_STATUS";
	/**
	 * 冻结状态 (1: 正常 2:冻结 )
	 * 
	 * @value 1 正常
	 */
	public static final Integer USER_STATUS_COMMON = 1;
	/**
	 * 教师状态 (1:在线 2:忙碌 3:离线)
	 * 
	 * @value 1:在线
	 */
	public static final Integer STATUS_ONLINE = 1;
	/**
	 * 教师状态 (1:在线 2:忙碌 3:离线)
	 * 
	 * @value 2:忙碌
	 */
	public static final Integer STATUS_BUSY = 2;

	/**
	 * 教师状态 (1:在线 2:忙碌 3:离线)
	 * 
	 * @value 3 离线
	 */
	public static final Integer STATUS_OFFLINE = 3;
	/**
	 * 冻结状态 (1: 正常 2:冻结 )
	 * 
	 * @value 2 冻结
	 */
	public static final Integer USER_STATUS_FREEZE = 2;
	/**
	 * 交易类型 (1:收入 2：支出)
	 * **/
	public static final String DIC_TRANSATION_TYPE = "TRANSATION_TYPE";
	/**
	 * 交易方式 (1:在线充值 2：提问支付)
	 */
	public static final String DIC_TRANSATION_STATUS = "TRANSATION_STATUS";
	/**
	 * 积分交易方式 (1:提问奖励 2：游戏支付)
	 */
	public static final String DIC_INTEGRAL_STATUS = "INTEGRAL_STATUS";
	/**
	 * 是否单次消耗
	 */
	public static final String DIC_SINGLE = "SINGLE";

	/**
	 * 问题状态（0:未解决 1:已解决）
	 */
	public static final String DIC_QUESTION_STATUS = "QUESTION_STATUS";
	/**
	 * 问题状态（0:未解决 1:已解决）
	 * 
	 * @value 0 未解决
	 */
	public static final Integer QUESTION_STATUS_UNRESOLVED = 0;

	/**
	 * 问题状态（0:未解决 1:已解决）
	 * 
	 * @value 1 已解决
	 */
	public static final Integer QUESTION_STATUS_RESOLVED = 1;

	/**
	 * 科目
	 */
	public static final String DIC_SUBJECT = "SUBJECT";

	/**
	 * 计时状态
	 * 
	 * @value 0 等待
	 */
	public final static Integer WATTING = 0;
	/**
	 * 计时状态
	 * 
	 * @value 1已加载
	 */
	public final static Integer LOADING = 1;
	/**
	 * 计时状态
	 * 
	 * @value 2 执行中
	 */
	public final static Integer DOING = 2;
	/**
	 * 计时状态
	 * 
	 * @value 3 已完成
	 */
	public final static Integer FINISH = 3;
	/**
	 * 计时状态
	 * 
	 * @value 4失败
	 */
	public final static Integer FAIL = 4;
	/**
	 * 计时状态
	 * 
	 * @value 5 已取消
	 */
	public final static Integer CANCEL = 5;

	public final static Integer TASK_AUTO = 0;
	public final static Integer TASK_HANDLE = 1;
	/**
	 * 问题是否超时回答
	 * 
	 * @value 0 否 具体作用在于判断该问题是否已经提示了
	 * **/
	public final static Integer FLG_OVER_TIME_NO = 0;
	/**
	 * 问题是否超时回答
	 * 
	 * @value 1 是 具体作用在于判断该问题是否已经提示了
	 * **/
	public final static Integer FLG_OVER_TIME_YES = 1;
	/**
	 * 设置超时时间（毫秒计算）
	 * 
	 * @value 15分钟
	 * **/
	public final static Long OVER_TIME = (long) 900000;
	/**
	 * 圈子状态 1:已停用 2:使用中
	 * 
	 * @value 2使用中
	 */
	public static final String DIC_CIRCLE_STATUS = "CIRCLE_STATUS";
	public static final Integer DIC_CIRCLE_USED = 2;
	/**
	 * 话题状态 (1:已停用 2:使用中)
	 * 
	 * @value 2使用中
	 */
	public static final String DIC_TOPIC_STATUS = "TOPIC_STATUS";
	public static final Integer DIC_TOPIC_USED = 2;
	/**
	 * 问题收藏 1：表示已经收藏 0：表示还没有收藏
	 */
	public static final String DIC_IS_COLLECTED = "is_collected";
	/**
	 * 问题收藏
	 * 
	 * @value 1：表示已经收藏
	 */
	public static final String IS_COLLECTED_YES = "1";
	/**
	 * 问题收藏
	 * 
	 * @value 0：表示还没有收藏
	 */
	public static final String IS_COLLECTED_NO = "0";
	/**
	 * App页面类型 1：全部问题
	 */
	public static final Integer ALL_QUESTION = 1;
	/**
	 * App页面类型 2.我的问题
	 */
	public static final Integer MY_QUESTION = 2;
	/**
	 * App页面默认请求数量
	 */
	public static final Integer pageSize = 10;
	/**
	 * 交易类型 (1:收入 2：支出)
	 * 
	 * @value 1 收入
	 * **/
	public static final Integer TRANSATION_TYPE_INCOME = 1;
	/**
	 * 交易类型 (1:收入 2：支出)
	 * 
	 * @value 2 支出
	 * **/
	public static final Integer TRANSATION_TYPE_SPENDING = 2;
	/**
	 * 交易方式 (1:在线充值 2：提问支付)
	 * 
	 * @value 1 在线充值
	 */
	public static final Integer TRANSATION_STATUS_INCOME = 1;
	/**
	 * 交易方式 (1:在线充值 2：提问支付)
	 * 
	 * @value 2 提问支付
	 */
	public static final Integer TRANSATION_STATUS_SPENDING = 2;
	/**
	 * 积分交易方式 (1:提问奖励 2：游戏支付)
	 * 
	 * @value 1 提问奖励
	 */
	public static final Integer INTEGRAL_STATUS_INCOME = 1;
	/**
	 * 积分交易方式 (1:提问奖励 2：游戏支付)
	 * 
	 * @value 2：游戏支付
	 */
	public static final Integer INTEGRAL_STATUS_SPENDING = 2;
	/**
	 * 教师是否关注 1 :未关注2:已关注
	 * 
	 * @value 2:已关注
	 */
	public static final String TEACHER_FOLLOWED = "2";
	/**
	 * 教师是否关注 1:未关注2:已关注
	 * 
	 * @value 1:未关注
	 */
	public static final String TEACHER_UNFOLLOWED = "1";
	/**
	 * App用戶默认图片
	 */
	public static final String APPUSER_DEFULT_PHOTO = "402889e94a7650a4014a765adcb40001";
	/**
	 * 问题找不图片的默认图片
	 */
	public static final String QUESTION_DEFULT_PHOTO = "402889e94a75e6bf014a75ee5c690002";
	/**
	 * 下单状态：已下单
	 */
	public static final String STATUS_READY = "已确认";
	/**
	 * 下单状态：下单中
	 */
	public static final String STATUS_ING = "下单中";
	/**
	 * 下单状态：已撤销
	 */
	public static final String STATUS_BACK = "已撤销";
}
