from django.db import models

class Timezone(models.Model):
    timestamp_field = models.DateTimeField()
    observation = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'timezone'
