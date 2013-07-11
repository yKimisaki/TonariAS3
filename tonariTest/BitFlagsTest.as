package tonari
{
	import flexunit.framework.Assert;

	public class BitFlagsTest
	{
		public var flags:BitFlags;
		
		[Before]
		public function setUp():void
		{
			flags = new BitFlags(0);
		}
		
		[After]
		public function tearDown():void
		{
			flags = null;
		}
		
		[Test]
		public function test():void
		{
			Assert.assertTrue(flags.enable(0));
			Assert.assertFalse(flags.enable(1));
			Assert.assertTrue(flags.any(0, 1));
			Assert.assertTrue(flags.any());
			Assert.assertFalse(flags.all(0, 1));
			
			flags.off(0);
			Assert.assertFalse(flags.enable(0));
			Assert.assertFalse(flags.any(0, 1));
			Assert.assertFalse(flags.any());
			
			flags.on(0);
			flags.on(1);
			Assert.assertTrue(flags.enable(0));
			Assert.assertTrue(flags.enable(1));
			Assert.assertTrue(flags.all(0, 1));
		}
		
		[Test]
		public function orTest():void
		{
			var f1:BitFlags = new BitFlags(0, 1, 2);
			var f2:BitFlags = new BitFlags(0, 1, 3);
			
			f1.or(f2);
			
			Assert.assertTrue(f1.all(0, 1, 2, 3));
		}
		
		[Test]
		public function andTest():void
		{
			var f1:BitFlags = new BitFlags(0, 1, 2);
			var f2:BitFlags = new BitFlags(0, 1, 3);
			
			f1.and(f2);
			
			Assert.assertTrue(f1.all(0, 1));
			Assert.assertFalse(f1.any(2, 3));
		}
	}
}