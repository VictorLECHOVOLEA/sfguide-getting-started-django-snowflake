# from django.db import models

# # Create your models here.
# class Trip(models.Model):
    
#     class Meta:
#         managed = False
#         db_table = 'TRIPS'


# copy from auto generated_models.py
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Trip(models.Model):
    trip_id = models.BigAutoField(blank=True, primary_key=True)
    tripduration = models.TextField(blank=True, null=True)  # This field type is a guess.
    starttime = models.TextField(blank=True, null=True)  # This field type is a guess.
    stoptime = models.TextField(blank=True, null=True)  # This field type is a guess.
    start_station_id = models.BigIntegerField(blank=True, null=True)
    start_station_name = models.TextField(blank=True, null=True)
    start_station_latitude = models.FloatField(blank=True, null=True)
    start_station_longitude = models.FloatField(blank=True, null=True)
    end_station_id = models.BigIntegerField(blank=True, null=True)
    end_station_name = models.TextField(blank=True, null=True)
    end_station_latitude = models.FloatField(blank=True, null=True)
    end_station_longitude = models.FloatField(blank=True, null=True)
    bikeid = models.BigIntegerField(blank=True, null=True)
    membership_type = models.TextField(blank=True, null=True)
    usertype = models.TextField(blank=True, null=True)
    birth_year = models.BigIntegerField(blank=True, null=True)
    gender = models.BigIntegerField(blank=True, null=True)

    class Meta:
        # managed = False
        db_table = 'TRIP'
