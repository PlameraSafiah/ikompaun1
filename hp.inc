<script type="text/javascript">
<!--
function textBoxOnBlur(elementRef)
{
 //5754578787, it should be 575-457-8787

 var elementValue = elementRef.value;

 // Remove all "(", ")", "-", and spaces...
 elementValue = elementValue.replace(/\(/g, '');
 elementValue = elementValue.replace(/\)/g, '');
 elementValue = elementValue.replace(/\-/g, '');
 elementValue = elementValue.replace(/\s+/g, '')


 elementRef.value = (elementValue.substr(0, 3) + '-' + elementValue.substr(3, 7));
}
// -->



<!--
function textBoxOnBlur2(elementRef)
{
 //5754578787, it should be 575-457-8787

 var elementValue = elementRef.value;

 // Remove all "(", ")", "-", and spaces...
 elementValue = elementValue.replace(/\(/g, '');
 elementValue = elementValue.replace(/\)/g, '');
 elementValue = elementValue.replace(/\-/g, '');
 elementValue = elementValue.replace(/\s+/g, '')


 elementRef.value = (elementValue.substr(0, 2) + '-' + elementValue.substr(2, 8));
}
// -->
</script>

 