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
	 * プッシュ通知を受け取るための機構を定義します。
	 * */
	public interface IObserver
	{
		function update():void;
	}
}