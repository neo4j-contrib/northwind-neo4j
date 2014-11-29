BEGIN {
  FS = ",";
  OFS = ",";
}
{
  $1 += offset;
  print;
}
