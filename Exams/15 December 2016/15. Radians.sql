CREATE FUNCTION udf_GetRadians(@Degrees FLOAT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @Radians FLOAT;
	SET @Radians = (@Degrees * PI()) / 180;

	RETURN @Radians
END