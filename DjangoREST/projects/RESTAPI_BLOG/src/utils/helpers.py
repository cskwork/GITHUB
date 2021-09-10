import os
import uuid
from django.utils.deconstruct import deconstructible
import re

from unidecode import unidecode
from django.utils.text import slugify

@deconstructible
class RandomFileName(object):
    def __init__(self, path):
        self.path = os.path.join(path, "%s%s")

    def __call__(self, _, filename):
        # @note It's up to the validators to check if it's the correct file type in name or if one even exist.
        extension = os.path.splitext(filename)[1]
        return str(self.path % (uuid.uuid4(), extension))


def unique_slug_generator(model_instance, title, author, slug_field):
    slug = slugify(unidecode(title))+'-'+slugify(author)
    # slug = slugify(unidecode(title))+'-'+slugify(unidecode(author))

    model_class = model_instance.__class__

    while model_class._default_manager.filter(slug=slug).exists():
        object_pk = model_class._default_manager.latest('pk')
        object_pk = object_pk.pk + 1

        slug = f'{slug}-{object_pk}'
    return slug