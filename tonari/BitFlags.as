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
	 * 32bitのビットフラグを作成します。
	 * */
	public class BitFlags
	{
		private var m_bitFlags:uint = 0;
		
		/**
		 * 初期状態では全てfalseです。
		 * 有効にしたいフラグをコンストラクタで指定する事が出来ます。
		 * 
		 * @param flags 初期状態で有効にしたいフラグ 
		 * */
		public function BitFlags(...flags)
		{
			var loopCount:int = flags.length;
			if (loopCount == 0) {
				return;
			} 
			
			for (var i:int = 0; i < loopCount; ++i) {
				if (available(flags[i])) {
					on(flags[i]);
				}
			}
		}
		
		/**
		 * ビットフラグがすべてtrueか調べます。
		 * 引数を指定した場合、それらのフラグがすべてtrueか調べます。
		 * */
		public function all(...flags):Boolean
		{
			var loopCount:int = flags.length;
			if (loopCount == 0) {
				return m_bitFlags == 0xffff;
			} 
			
			for (var i:int = 0; i < loopCount; ++i) {
				if (!available(flags[i])) {
					return false;
				}
				
				if (!enable(flags[i])) {
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
				return m_bitFlags != 0x0;
			} 
			
			for (var i:int = 0; i < loopCount; ++i) {
				if (!available(flags[i])) {
					continue;
				}
				
				if (enable(flags[i])) {
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * 指定されたフラグがtrueかどうかを調べます。
		 * */
		public function enable(flag:uint):Boolean
		{
			if (!available(flag)) {
				return false;
			}
			return (m_bitFlags & getBitPosition(flag)) > 0;
		}
		
		/**
		 * 指定されたフラグをtrueにします。
		 * */
		public function on(flag:uint):void
		{
			if (!available(flag)) {
				return;
			}
			m_bitFlags |= getBitPosition(flag);
		}
		
		/**
		 * 指定されたフラグをfalseにします。
		 * */
		public function off(flag:uint):void
		{
			if (!available(flag)) {
				return;
			}
			m_bitFlags &= ~getBitPosition(flag);
		}
		
		/**
		 * このフラグに、別のフラグをor演算子で加えます。
		 * */
		public function or(bitFlags:BitFlags):void
		{
			m_bitFlags |= bitFlags.m_bitFlags;
		}
		
		/**
		 * このフラグに、別のフラグをand演算子でマスクします。
		 * */
		public function and(bitFlags:BitFlags):void
		{
			m_bitFlags &= bitFlags.m_bitFlags;
		}
		
		private function available(flag:*):Boolean
		{
			if (!(flag is int || flag is uint)) {
				return false;
			}
			if (flag < 0 || flag > 31) {
				return false;
			}
			return true;
		}
		
		private function getBitPosition(flag:uint):uint
		{
			return 1 << flag;
		}
	}
}