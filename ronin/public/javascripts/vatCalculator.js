function calculate_vat(gross_id, net_id, vat_id)
{
  g = document.getElementById(gross_id)
  n = document.getElementById(net_id)
  v = document.getElementById(vat_id)
  gross = parseFloat( g.value )
  
  if( isNaN( gross ) )
  {
     v.value = 0.00
     n.value = 0.00
  }
  else
  {
     // as of 1/12/08 vat fraction no longer 7/47
     //vat = gross * ( 3/23 )
     //vat = gross * ( 7/47 ) 17.5 replaced 2011
     vat = gross * ( 1/6 )
     net = gross - vat
     v.value = vat.toFixed(2)
     n.value = net.toFixed(2)
  }
  
  return false;
}
