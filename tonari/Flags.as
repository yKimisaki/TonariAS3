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
	 * IEnumに対するビットフラグを作成します。
	 * */
	public class Flags
	{
		private var m_bitFlags:BitFlags = new BitFlags();
		
		/**
		 * 初期状態では全てfalseです。
		 * 有効にしたいフラグをコンストラクタで指定する事が出来ます。
		 * 
		 * @param flags 初期状態で有効にしたいフラグ 
		 * */
		public function Flags(...flags)
		{
			var loopCount:int = flags.length;
			for (var i:int = 0; i < loopCount; ++i) {
				var f:IEnum = flags[i] as IEnum;
				if (f == null) {
					continue;
				}
				
				m_bitFlags.on(f.toInt());
			}
		}
		
		/**
		 * 引数を指定し、それらのフラグがすべてtrueか調べます。
		 * 引数がない場合はtrueが返ります。
		 * */
		public function all(...flags):Boolean
		{			
			var loopCount:int = flags.length;
			
			for (var i:int = 0; i < loopCount; ++i) {
				var f:IEnum = flags[i] as IEnum;
				if (f == null) {
					return false;
				}
				
				if (!m_bitFlags.enable(f.toInt())) {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * ビットフラグのいずれかがtrueか調べます。
		 * 引数を指定した場合、それらのフラグのいずれかがtrueか調べます。
		 * */
		public function any(...flags):Boolean
		{
			var loopCount:int = flags.length;
			if (loopCount == 0) {
				return m_bitFlags.any();
			}
			
			for (var i:int = 0; i < loopCount; ++i) {
				var f:IEnum = flags[i] as IEnum;
				if (f == null) {
					continue;
				}
				
				if (m_bitFlags.enable(f.toInt())) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 指定されたフラグがtrueかどうかを調べます。
		 * */
		public function enable(flags:IEnum):Boolean
		{
			if (flags == null) {
				return false;
			}
			return m_bitFlags.enable(flags.toInt());
		}
		
		/**
		 * 指定されたフラグをtrueにします。
		 * */
		public function on(flags:IEnum):void
		{
			if (flags == null) {
				return;
			}
			m_bitFlags.on(flags.toInt());
		}
		
		/**
		 * 指定されたフラグをfalseにします。
		 * */	
		public function off(flags:IEnum):void
		{
			if (flags == null) {
				return;
			}
			m_bitFlags.off(flags.toInt());
		}
		
		/**
		 * このフラグに、別のフラグをor演算子で加えます。
		 * */
		public function or(flags:Flags):void
		{
			m_bitFlags.or(flags.m_bitFlags);
		}
		
		/**
		 * このフラグに、別のフラグをand演算子でマスクします。
		 * */
		public function and(flags:Flags):void
		{
			m_bitFlags.and(flags.m_bitFlags);
		}
	}
}