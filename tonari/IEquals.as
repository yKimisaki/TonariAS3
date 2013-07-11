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
	 * 等価比較可能なクラスであることを定義します。
	 * */
	public interface IEquals
	{
		function equals(toCompare:*):Boolean;
	}
}