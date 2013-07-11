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
	 * ３要素のタプルです。
	 * */
	public class Tuple3 implements IEquals
	{
		private var m_left:*;
		public function get left():* { return m_left; }
		public function set left(value:*):void { left = value; }
		
		private var m_center:*;
		public function get center():* { return m_center; }
		public function set center(value:*):void { m_center = value; }
		
		private var m_right:*;
		public function get right():* { return m_right; }
		public function set right(value:*):void { m_right = value; }
		
		public function Tuple3(left:*, center:*, right:*)
		{
			m_left = left;
			m_center = center;
			m_right = right;
		}
		
		public function equals(toCompare:*):Boolean
		{
			var t:Tuple3 = toCompare as Tuple3;
			if (t == null) {
				return false;
			}
			
			var l:IEquals = m_left as IEquals;
			var c:IEquals = m_center as IEquals;
			var r:IEquals = m_right as IEquals;
			var lResult:Boolean = l != null ? l.equals(t.left) : m_left == t.left;
			var cResult:Boolean = c != null ? c.equals(t.center) : m_center == t.center;
			var rResult:Boolean = r != null ? r.equals(t.right) : m_right == t.right;
			
			return lResult && cResult && rResult;
		}
	}
}