# Generated by Django 4.2.9 on 2024-10-09 05:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0003_scenarioquestion_scenario3_description_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='scenarioquestion',
            old_name='scenario1_description',
            new_name='scenario_description',
        ),
        migrations.RenameField(
            model_name='scenarioquestion',
            old_name='scenario1_image',
            new_name='scenario_image',
        ),
        migrations.RenameField(
            model_name='scenarioquestion',
            old_name='scenario1_label',
            new_name='scenario_label',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario2_description',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario2_image',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario2_label',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario3_description',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario3_image',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='scenario3_label',
        ),
        migrations.RemoveField(
            model_name='scenarioquestion',
            name='user_profile_id',
        ),
    ]