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
	 * ISubjectを実装し、基本的な購読、解除、通知の機構を提供します。
	 * */
	public class DefaultSubject implements ISubject
	{
		private var m_observers:Vector.<IObserver> = new Vector.<IObserver>();
		
		/**
		 * 購読を開始します。
		 * */
		public function subscribe(observer:IObserver):void
		{	
			// 重複登録はしない
			if (m_observers.indexOf(observer) >= 0) {
				return;
			}
			
			m_observers.push(observer);
		}
		
		/**
		 * 購読を解除します。
		 * */
		public function cancel(observer:IObserver):void
		{
			var index:int = m_observers.indexOf(observer);
			if (index < 0) {
				return;
			}
			
			m_observers.splice(index, 1);
		}
		
		/**
		 * 購読中のIObserverに対して、変更を通知します。
		 * */
		public function notify():void 
		{
			var length:int = m_observers.length;
			for (var i:int = 0; i < length; ++i) {
				m_observers[i].update();
			}
		}
	}
}