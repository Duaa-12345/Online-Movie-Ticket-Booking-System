using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{

    public class Schedule
    {
        public String title;
        public String startTime;
        public int MovieID;
        public Schedule(String t, String s)
        {
            title = t;
            startTime = s;
        }
        public String getTtile()
        {
            return title;
        }
        public String getTime()
        {
            return startTime;
        }

    }
}