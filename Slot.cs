using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Slot
	{
		int slotID;
		string startTime;
		string endTime;
		public Slot(int slotID, string startTime, string endTime)
		{
			this.slotID = slotID;
			this.startTime = startTime;
			this.endTime = endTime;
		}
	}
}