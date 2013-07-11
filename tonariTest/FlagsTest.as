package tonari
{
	import flexunit.framework.Assert;

	public class FlagsTest
	{
		public var flags:Flags;
		
		[Before]
		public function setUp():void
		{
			flags = new Flags(DummyEnum.hoge);
		}
		
		[After]
		public function tearDown():void
		{
			flags = null;
		}
		
		[Test]
		public function test():void
		{
			Assert.assertTrue(flags.all());
			Assert.assertTrue(flags.any());
			
			Assert.assertTrue(flags.enable(DummyEnum.hoge));
			Assert.assertFalse(flags.enable(DummyEnum.fuga));
			Assert.assertTrue(flags.any(DummyEnum.hoge, DummyEnum.fuga));
			Assert.assertFalse(flags.all(DummyEnum.hoge, DummyEnum.fuga));
			
			flags.off(DummyEnum.hoge);
			Assert.assertFalse(flags.enable(DummyEnum.hoge));
			Assert.assertFalse(flags.any(DummyEnum.hoge, DummyEnum.fuga));
			Assert.assertFalse(flags.any());
			
			flags.on(DummyEnum.hoge);
			flags.on(DummyEnum.fuga);
			Assert.assertTrue(flags.enable(DummyEnum.hoge));
			Assert.assertTrue(flags.enable(DummyEnum.fuga));
			Assert.assertTrue(flags.all(DummyEnum.hoge, DummyEnum.fuga));
		}
		
		[Test]
		public function orTest():void
		{
			var f1:Flags = new Flags(DummyEnum.hoge);
			var f2:Flags = new Flags(DummyEnum.fuga);
			
			f1.or(f2);
			
			Assert.assertTrue(f1.all(DummyEnum.hoge, DummyEnum.fuga));
		}
		
		[Test]
		public function andTest():void
		{
			var f1:Flags = new Flags(DummyEnum.hoge);
			var f2:Flags = new Flags(DummyEnum.fuga);
			
			f1.and(f2);
			
			Assert.assertFalse(f1.any(DummyEnum.hoge, DummyEnum.fuga));
		}
	}
}

import tonari.IEnum;

class DummyEnum implements IEnum
{
	public static const hoge:DummyEnum = new DummyEnum(0);
	public static const fuga:DummyEnum = new DummyEnum(1);
	
	private var m_index:uint;
	public function DummyEnum(index:uint)
	{
		m_index = index;
	}
	public function toUint():uint
	{
		return m_index;
	}
}