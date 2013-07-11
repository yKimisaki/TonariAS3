package tonari
{
	import flexunit.framework.Assert;

	public class DefaultSubjectTest
	{
		private var m_subject:DefaultSubject;
		private var m_observer_1:DummyObserver;
		private var m_observer_2:DummyObserver;
		
		[Before]
		public function setUp():void
		{
			m_subject = new DefaultSubject();
			m_observer_1 = new DummyObserver();
			m_observer_2 = new DummyObserver();
		}
		
		[After]
		public function tearDown():void
		{
			m_subject = null;
			m_observer_1 = null;
			m_observer_2 = null;
		}
		
		[Test]
		public function normalTest():void
		{
			m_subject.subscribe(m_observer_1);
			m_subject.notify();
			Assert.assertEquals(1, m_observer_1.m_count);
		}
		
		[Test]
		public function sameInstanceTest():void
		{
			m_observer_1.m_count = 0;
			
			// 同じインスタンスは重複購読させない
			m_subject.subscribe(m_observer_1);
			m_subject.subscribe(m_observer_1);
			m_subject.notify();
			Assert.assertEquals(1, m_observer_1.m_count);
		}
		
		[Test]
		public function differentInstanceTest():void
		{
			m_observer_1.m_count = 0;
			m_observer_2.m_count = 0;
			
			// 違うインスタンスは重複購読させる
			m_subject.subscribe(m_observer_1);
			m_subject.subscribe(m_observer_2);
			m_subject.notify();
			Assert.assertEquals(1, m_observer_1.m_count);
			Assert.assertEquals(1, m_observer_2.m_count);
		}
		
		[Test]
		public function cancelErrorTest():void
		{
			// 登録してないものをキャンセルしてもエラーなし
			m_subject.cancel(m_observer_1);
		}
		
		[Test]
		public function cancelTest():void
		{
			m_observer_1.m_count = 0;
			m_observer_2.m_count = 0;
			
			m_subject.subscribe(m_observer_1);
			m_subject.subscribe(m_observer_2);
			m_subject.notify();
			Assert.assertEquals(1, m_observer_1.m_count);
			Assert.assertEquals(1, m_observer_2.m_count);
			
			// キャンセルのテスト
			m_subject.cancel(m_observer_2);
			m_subject.notify();
			Assert.assertEquals(2, m_observer_1.m_count);
			Assert.assertEquals(1, m_observer_2.m_count);
		}
	}
}

import tonari.IObserver;

class DummyObserver implements IObserver
{
	public var m_count:int = 0;
	public function update():void { ++m_count; }
}