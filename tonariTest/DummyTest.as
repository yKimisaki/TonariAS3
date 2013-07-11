package tonari
{
	import flexunit.framework.Assert;

	public class DummyTest
	{
		private var d1_1:Dummy;
		private var d1_2:Dummy;
		private var d2_1:Dummy;
		
		[Before]
		public function setup():void 
		{
			d1_1 = new Dummy(5);
			d1_2 = new Dummy(5);
			d2_1 = new Dummy(10);
		}
		
		[After]
		public function teardown():void
		{
			d1_1 = null;
			d1_2 = null;
			d2_1 = null;
		}
		
		[Test]
		public function equalTest():void
		{
			Assert.assertTrue(d1_1.equals(d1_2));
			Assert.assertFalse(d1_1.equals(d2_1));
			
			Assert.assertFalse(d1_1.equals(5));
		}
	}
}