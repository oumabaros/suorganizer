# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organizer', '0007_startup_tag_field_optional'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='newslink',
            options={},
        ),
        migrations.AlterField(
            model_name='newslink',
            name='pub_date',
            field=models.DateField(verbose_name='date published'),
        ),
        migrations.AlterField(
            model_name='startup',
            name='founded_date',
            field=models.DateField(verbose_name='date founded'),
        ),
        migrations.AlterField(
            model_name='startup',
            name='slug',
            field=models.SlugField(unique=True, help_text='A Label for URL config.', max_length=31),
        ),
        migrations.AlterField(
            model_name='tag',
            name='slug',
            field=models.SlugField(unique=True, help_text='A Label for URL config.', max_length=31),
        ),
    ]
