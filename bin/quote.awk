BEGIN { FS=","; OFS=","; }
{
  if (NR>1) {
    sub($9, "\"&\"");
    sub($10, "\"&\"");
    sub($11, "\"&\"");
    print
  }
}
