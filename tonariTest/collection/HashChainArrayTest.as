package tonari.collection
{	
	import flexunit.framework.Assert;

	public class HashChainArrayTest
	{
		private var food:HashChainArray;
		
		[Before]
		public function setup():void
		{
			food = new HashChainArray();
		}
		
		[After]
		public function teardown():void
		{
			food = null;
		}
		
		[Test]
		public function addTest():void
		{
			food.add("fruit", "apple");
			food.add("fruit", "orange");
			food.add("vegetable", "tomato");
			
			food.foreach(function (key:*, value:*):void { trace(key + ": " + value); });
		}
		
		[Test]
		public function deleteTest():void
		{
			food.add("fruit", "apple");
			food.add("fruit", "orange");
			food.add("vegetable", "tomato");
			
			food.deleteArray("fruit");
			food.deleteArray("meet"); // エラー出ない
			
			food.foreach(function (key:*, value:*):void { trace(key + ": " + value); });
		}
		
		[Test]
		public function existTest():void
		{
			food.add("fruit", "apple");
			food.add("vegetable", "tomato");
			
			Assert.assertTrue(food.exist("fruit"));
			Assert.assertTrue(food.exist("vegetable"));
			Assert.assertFalse(food.exist("meet"));
			
			food.deleteArray("fruit");
			
			Assert.assertFalse(food.exist("fruit"));
			Assert.assertTrue(food.exist("vegetable"));
		}
		
		[Test]
		public function equalsTest():void
		{
			var a:HashChainArray = new HashChainArray();
			a.add("hoge", 5);
			a.add("fuga", 4);
			a.add("foo", 3);
			a.add("hoge", 2);
			a.add("foo", 1);
			
			var b:HashChainArray = new HashChainArray();
			b.add("hoge", 5);
			b.add("fuga", 4);
			b.add("foo", 3);
			b.add("hoge", 2);
			b.add("foo", 1);
			
			Assert.assertFalse(a == b);
			Assert.assertTrue(a.equals(b));
		}
	}
}