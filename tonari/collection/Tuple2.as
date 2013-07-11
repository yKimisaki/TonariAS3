/// 
/// Author:
///     Yoshitaka Kimisaki
///         @y_kimisaki
///         y.kimisaki@gmail.com
///
/// Date: 
///     2013 07 11
///    

package tonari.collection
{
	import tonari.IEquals;
	
	/**
	 * ２要素のタプルです。
	 * */
	public class Tuple2 implements IEquals
	{
		private var m_left:*;
		public function get left():* { return m_left; }
		public function set left(value:*):void { left = value; }
		
		private var m_right:*;
		public function get right():* { return m_right; }
		public function set right(value:*):void { m_right = value; }
		
		public function Tuple2(left:*, right:*)
		{
			m_left = left;
			m_right = right;
		}
		
		public function equals(toCompare:*):Boolean
		{
			var t:Tuple2 = toCompare as Tuple2;
			if (t == null) {
				return false;
			}
			
			var l:IEquals = m_left as IEquals;
			var r:IEquals = m_right as IEquals;
			var lResult:Boolean = l != null ? l.equals(t.left) : m_left === t.left;
			var rResult:Boolean = r != null ? r.equals(t.left) : m_right === t.right;
			
			return lResult && rResult;
		}
	}
}