package tonari
{
	public class Dummy implements IEquals
	{
		private var m_value:int;
		
		public function Dummy(value:int)
		{
			m_value = value;
		}
		
		public function equals(toCompare:*):Boolean
		{
			var d:Dummy = toCompare as Dummy;
			if (d == null) {
				return false;
			}
			
			return m_value == d.m_value;
		}
	}
}