/// 
/// Author:
///     Yoshitaka Kimisaki
///         @y_kimisaki
///         y.kimisaki@gmail.com
///
/// Date: 
///     2013 07 11
///    

package tonari
{
	/**
	 * プッシュ通知を発行する機構を定義します。
	 * */
	public interface ISubject
	{
		function subscribe(observer:IObserver):void;
		function cancel(observer:IObserver):void;
	}
}