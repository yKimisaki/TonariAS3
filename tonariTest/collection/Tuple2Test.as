package tonari.collection
{	
	import flexunit.framework.Assert;
	
	import tonari.Dummy;

	public class Tuple2Test
	{
		private var t1_1:Tuple2;
		private var t1_2:Tuple2;
		private var t2_1:Tuple2;
		private var t2_2:Tuple2;
		private var t2_3:Tuple2;
		
		[Before]
		public function setup():void 
		{
			t1_1 = new Tuple2(0, "blue");
			t1_2 = new Tuple2(0, "blue");
			t2_1 = new Tuple2(new Dummy(0), "blue");
			t2_2 = new Tuple2(new Dummy(0), "blue");
			t2_3 = new Tuple2(new Dummy(3), "blue");
		}
		
		[After]
		public function teardown():void
		{
			t1_1 = null;
			t1_2 = null;
			t2_1 = null;
			t2_2 = null;
			t2_3 = null;
		}
		
		[Test]
		public function equalsTest():void
		{
			Assert.assertTrue(t1_1.equals(t1_2));
			Assert.assertFalse(t1_1.equals(t2_1));
			
			Assert.assertTrue(t2_1.equals(t2_2));
			Assert.assertFalse(t2_1.equals(t2_3));
		}
	}
}