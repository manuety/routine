# Routine (Android)

App web impacchettata con Capacitor. Notifiche locali schedulate con allarmi esatti: arrivano anche con app chiusa.

## Build APK (cloud, nessun Android Studio)

1. Crea repo su github.com (privato va bene).
2. Carica tutto il contenuto di questa cartella nel repo, inclusa `.github`.
3. Apri tab **Actions**, scegli **Build APK**, premi **Run workflow**.
4. Dopo circa 5 minuti: apri il run, scarica artifact **routine-apk**.
5. Estrai lo zip. Trasferisci `app-debug.apk` sul telefono e installa.
   Android chiede di permettere "installa app sconosciute" per il file manager o browser usato.

## Primo avvio sul telefono

- Consenti **notifiche**.
- Se compare la schermata **Sveglie e promemoria**: attiva per Routine.
- Impostazioni batteria: metti Routine su **Nessuna restrizione**. Alcuni produttori (Xiaomi, Huawei, Samsung, Oppo) bloccano gli allarmi in background altrimenti.

## Modifica app

Cambia `www/index.html`, fai push: workflow ricostruisce APK.

## Build locale (con Android Studio)

```
npm install
npx cap add android
bash scripts/patch-android.sh
npx cap sync android
npx cap open android
```
