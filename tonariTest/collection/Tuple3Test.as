package bml.util.tuple
{	
	import flexunit.framework.Assert;
	
	import system.Dummy;

	public class Tuple3Test
	{
		private var t1_1:Tuple3;
		private var t1_2:Tuple3;
		private var t2_1:Tuple3;
		private var t2_2:Tuple3;
		private var t2_3:Tuple3;
		
		[Before]
		public function setup():void 
		{
			t1_1 = new Tuple3(5, 10, "blue");
			t1_2 = new Tuple3(5, 10, "blue");
			t2_1 = new Tuple3(5, new Dummy(10), "blue");
			t2_2 = new Tuple3(5, new Dummy(10), "blue");
			t2_3 = new Tuple3(5, new Dummy(15), "blue");
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
