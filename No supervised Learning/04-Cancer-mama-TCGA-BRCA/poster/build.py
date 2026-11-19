"""Genera index.html a partir de plantilla.html y datos.json."""
import json
from pathlib import Path
aqui = Path(__file__).parent
datos = json.loads((aqui / 'datos.json').read_text(encoding='utf-8'))
html = (aqui / 'plantilla.html').read_text(encoding='utf-8')
html = html.replace('/*__DATOS__*/null', json.dumps(datos, ensure_ascii=False, separators=(',', ':')))
(aqui / 'index.html').write_text(html, encoding='utf-8')
print('index.html', len(html) // 1024, 'KB')
