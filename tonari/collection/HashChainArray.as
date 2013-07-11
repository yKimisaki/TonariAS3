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
	 * 任意の値に紐づけられた配列群を提供します。
	 * １つのkeyに対し、１つのArrayが用意されます。
	 * */
	public class HashChainArray implements IEquals
	{
		private var collection:Array = new Array();
		private var keys:Array = new Array();
		
		/**
		 * 指定したkeyの行の末尾に要素を追加します。
		 * 指定したkeyの行がない場合は、空の配列を作成し、その末尾に要素を追加します。
		 * */
		public function add(key:*, value:*):void 
		{
			getArray(key).push(value);
		}
		
		/**
		 * 指定したkeyの行を取得します。
		 * 指定したkeyの行がない場合は、空の配列を作成して返します。
		 * */
		public function getArray(key:*):Array
		{
			if (!exist(key)) {
				collection[key] = new Array();
				if (keys.indexOf(key) < 0) {
					keys.push(key);
				}
			}
			return collection[key];
		}
		
		/**
		 * 指定したkeyの行を削除します。
		 * */
		public function deleteArray(key:*):void
		{
			if (!exist(key)) {
				return;
			}
			collection[key] = null;
		}
		
		/**
		 * 指定したkeyが存在するか調べます。
		 * */
		public function exist(key:*):Boolean
		{
			return collection.hasOwnProperty(key) && (collection[key] != null);
		}
		
		/**
		 * IConsecutiveProcessableを実装します。
		 * 各要素すべてに対して一括で処理を行います。
		 * 
		 * @param func function (key:any, value:any):void;
		 * */
		public function foreach(func:Function):void
		{
			var loopCount:* = keys.length;
			for (var i:* = 0; i < loopCount; ++i) {
				var line:Array = getArray(keys[i]);
				var internalLoopCount:* = line.length;
				for(var j:* = 0; j < internalLoopCount; ++j) {
					func(keys[i], line[j]);
				}
			}
		}
		
		/**
		 * IEqualsを実装します。
		 * 内部の要素すべてに対して等価比較をします。
		 * この比較は厳密な等価比較ではありません。
		 * */
		public function equals(toCompare:*):Boolean
		{
			var toCompareArray:HashChainArray = toCompare as HashChainArray;
			if (toCompareArray == null) {
				return false;
			}
			
			var loopCount:* = this.keys.length;
			for (var i:* = 0; i < loopCount; ++i) {
				// 各keyが存在しないならその場でfalse
				if (!toCompareArray.exist(keys[i]) || !this.exist(keys[i])) {
					return false;
				}
				
				var toCompareKeyArray:Array = toCompareArray.collection[keys[i]];
				var thisKeyArray:Array = this.collection[keys[i]];
				
				// 内部の要素の長さが違うならfalse
				if (toCompareKeyArray.length != thisKeyArray.length) {
					return false;
				}
				
				// 各要素が等しいかチェック
				var internalLoopCount:* = thisKeyArray.length;
				for (var j:* = 0; j < internalLoopCount; ++j) {
					if (toCompareKeyArray[j] != thisKeyArray[j]) {
						return false;
					}
				}
			}
			
			return true;
		}
	}
}