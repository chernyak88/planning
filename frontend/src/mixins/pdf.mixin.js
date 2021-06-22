import html2pdf from 'html2pdf.js'

export default {
    methods: {
        async exportToPdfMixin(el, filename = 'output') {
            const curDate = new Date().toLocaleString().replace(', ', '_').replace(/\./g, '-').replace(/\:/g, '-')

            const tables = el.querySelectorAll('table')
            for (let i = 0; i < tables.length; i++) {
                tables[i].style.width = null
            }

            const opt = {
              margin: 12,
              filename: `${filename}_${curDate}`,
              image: { type: 'jpeg', quality: 1 },
              html2canvas:  { scale: 3 },
              jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
            }

            await html2pdf().set(opt).from(el).save()
        }
    }
}