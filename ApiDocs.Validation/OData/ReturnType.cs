﻿namespace ApiDocs.Validation.OData
{
    using System;
    using System.Xml.Linq;

    public class ReturnType
    {
        public string Type { get; set; }
        public bool Nullable { get; set; }
        
        
        public static string ElementName { get { return "ReturnType"; } }

        internal static ReturnType FromXml(XElement xml)
        {
            if (xml.Name.LocalName != ElementName) throw new ArgumentException("xml wasn't a ReturnType element");

            var obj = new ReturnType
            {
                Type = xml.AttributeValue("Type"),
                Nullable = xml.AttributeValue("Nullable").ToBoolean()
            };

            return obj;
        }

    }
}
